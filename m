Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F75EC52D7B
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 15:31:14 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web11.75081.1723563072945452382
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Aug 2024 08:31:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=rZTSaZJD;
 spf=pass (domain: baylibre.com, ip: 209.85.160.169, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4519383592aso34901381cf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 08:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723563072; x=1724167872; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ueyP18UgXbarLZ6sCzUSJXgwHHaU8e1v4cmoo+0MIPg=;
        b=rZTSaZJDs+9D9Gg+JHQ0KlOsoM/0ceH6fLYyslcj4P7+HKyu9iZpVCNbiINKm2P066
         MdkGpmcCaHoGCBSphIV/CR5e9DTm2WD2uqjq57a7KomtqKbwbbPA2Gs+bn7qg1oRCfFr
         7B3BiTDXp4sqQezUtX5FEoGi5tk9YspfZdfbT1dC6YE+Ke/Y1JCZ/BTAh5WIC3+iSAyP
         4wYdwK4abPLqYEVQ+0rIQ/UYS0OC9ItghEFCHOgIcdFHZtZWF8pUNxySe3yJGBH8yxGy
         NADEWbw2BWBhs+y8jxfJKeINfsVvdrP1qE68pKPSJhAtMP5g4brtXNBjL0yYCv5iWSly
         +Kqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723563072; x=1724167872;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ueyP18UgXbarLZ6sCzUSJXgwHHaU8e1v4cmoo+0MIPg=;
        b=nRufMCg6xUjyNFIKRo8QY/GV+NYpofpK3gOevYcr3ahE7mEeL+ImfrdAVj+ZKf6UAZ
         m57PQEvX0SCn56X4h+9CRdyY9vYya1Zea6mDgRNp4kto2XIWwiRwmg586PYCxz5lYG27
         nRskrC4ZN1OAl9lJj7XE+qTl39DOsCEBLK0kjkO4yLjfEI72F/rXYlBwdHkWh6cKz2m4
         VTPHt6MxVukZRvKVW4ntcxc9ogc+Id9Qq11L5bWx901cE4XXKYWgd5XBsvQcky0GPD6A
         q7UbMxHWblmf2pgcBBXJJnJ18eOiRUSbtfnqpHx5SVylrw25QgQdmfj3PmI+fXPVyuI4
         bG7g==
X-Gm-Message-State: AOJu0YyAL3b4+TvbTUO+tzW/XKBZvQO/6WyU53sMVSmooOc4y+nPwkXb
	+T2+4hCquPj/W01pjl6p0JmyCMbQ/OFqEw49e/iOsceBFB5VlIxtzqGN52V/h7Y=
X-Google-Smtp-Source: AGHT+IEtAWlcNXFLUwqEsGVK9eh6+MVzzNw+hbOOQOYt2BAGQ/WvEU4RU3q6U1npeRTBOO1+cEEU4Q==
X-Received: by 2002:a05:622a:1f05:b0:447:e890:b1a0 with SMTP id d75a77b69052e-453498cd307mr44706271cf.14.1723563071779;
        Tue, 13 Aug 2024 08:31:11 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4531c1c7d53sm33067801cf.37.2024.08.13.08.31.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Aug 2024 08:31:11 -0700 (PDT)
Message-ID: <76525127-94de-4ba6-abaa-c1f2c6d13830@baylibre.com>
Date: Tue, 13 Aug 2024 11:31:10 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH 1/3] python3: upgrade 3.12.4 -> 3.12.5
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
References: <20240809122217.3825274-1-tgamblin@baylibre.com>
 <20240813095629734b9d87@mail.local>
 <17EB4FFEDB5B735B.10903@lists.openembedded.org>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <17EB4FFEDB5B735B.10903@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 15:31:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203283


On 2024-08-13 10:27 a.m., Trevor Gamblin via lists.openembedded.org wrote:
>
> On 2024-08-13 5:56 a.m., Alexandre Belloni wrote:
>> Hello Trevor,
>>
>> This causes a new ptest failure:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6894/steps/12/logs/stdio 
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6898/steps/12/logs/stdio 
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/6725/steps/13/logs/stdio 
>>
>>
>> https://autobuilder.yocto.io/pub/non-release/20240812-77/testresults/qemux86-64-ptest/python3.log 
>>
>>
>> FAIL: test_write_read_limited_history 
>> (test.test_readline.TestReadline.test_write_read_limited_history)
> Looking into it. The test code seems a little strange to me. Might 
> submit a patch to disable the test case shortly...
Sent a patch to skip it in ptests for now.
>>
>> ======================================================================
>> ERROR: test_write_read_limited_history 
>> (test.test_readline.TestHistoryManipulation.test_write_read_limited_history)
>> ----------------------------------------------------------------------
>> Traceback (most recent call last):
>>    File "/usr/lib/python3.12/test/test_readline.py", line 153, in 
>> test_write_read_limited_history
>>      readline.read_history_file(TESTFN)
>> OSError: [Errno 22] Invalid argument
>>
>> ======================================================================
>> ERROR: test_write_read_limited_history 
>> (test.test_readline.TestReadline.test_write_read_limited_history)
>> ----------------------------------------------------------------------
>> Traceback (most recent call last):
>>    File "/usr/lib/python3.12/test/test_readline.py", line 362, in 
>> test_write_read_limited_history
>>      readline.read_history_file(TESTFN)
>> OSError: [Errno 22] Invalid argument
>>
>> ----------------------------------------------------------------------
>> Ran 11 tests in 0.266s
>>
>> FAILED (errors=2, skipped=3)
>> test test_readline failed
>>
>>
>> On 09/08/2024 08:22:15-0400, Trevor Gamblin wrote:
>>> Changelog: 
>>> https://docs.python.org/release/3.12.5/whatsnew/changelog.html
>>>
>>> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>>> ---
>>>   .../python/{python3_3.12.4.bb => python3_3.12.5.bb}             | 
>>> 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>   rename meta/recipes-devtools/python/{python3_3.12.4.bb => 
>>> python3_3.12.5.bb} (99%)
>>>
>>> diff --git a/meta/recipes-devtools/python/python3_3.12.4.bb 
>>> b/meta/recipes-devtools/python/python3_3.12.5.bb
>>> similarity index 99%
>>> rename from meta/recipes-devtools/python/python3_3.12.4.bb
>>> rename to meta/recipes-devtools/python/python3_3.12.5.bb
>>> index 119fe10ca9..5665c90fa9 100644
>>> --- a/meta/recipes-devtools/python/python3_3.12.4.bb
>>> +++ b/meta/recipes-devtools/python/python3_3.12.5.bb
>>> @@ -39,7 +39,7 @@ SRC_URI:append:class-native = " \
>>> file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch 
>>> \
>>>              "
>>>   -SRC_URI[sha256sum] = 
>>> "f6d419a6d8743ab26700801b4908d26d97e8b986e14f95de31b32de2b0e79554"
>>> +SRC_URI[sha256sum] = 
>>> "fa8a2e12c5e620b09f53e65bcd87550d2e5a1e2e04bf8ba991dcc55113876397"
>>>     # exclude pre-releases for both python 2.x and 3.x
>>>   UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
>>> -- 
>>> 2.39.2
>>>
>>>
>>>
>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203280): https://lists.openembedded.org/g/openembedded-core/message/203280
> Mute This Topic: https://lists.openembedded.org/mt/107806767/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

