Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8D7FC52D7B
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 14:27:23 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web11.73361.1723559237697523029
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Aug 2024 07:27:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=hbECrYXg;
 spf=pass (domain: baylibre.com, ip: 209.85.222.172, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7a1e2ac1ee5so360677885a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 07:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723559237; x=1724164037; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6urcrUwRNn4ooZIoALMb0qS0YSJcXCz3VLqmrwBUYP8=;
        b=hbECrYXgSK5D/KJE3lOxj5Bqw9cAzK6vCGhlVVwkPjEPIZhyWaijQGZXuZUw3d0e78
         wh7/KwJismo1E1UlSzrlzmx4HTK+00S6RiqU8t45YD2mI8Wr4Ig5wG78X4fdiUuk2jIR
         dh7rWhLEfv3FQ9IPJJD3xXiWIvz0O6FQmm1w04zl9mjCOCLpbiF1PKda3N63VcV528CP
         ED/aciEJEzedxFsQ9sN/SrI2glIPudcJSl+LfKXSSfh2cxhe+IGcwJdYf8bX1VaeJoNA
         ioZIhpXS7Wgg2RVF/imfVnK5GWGi/E+cDwcqGxY9zWPB/28YL4R++QqAw+hIaF6A7aCV
         hLaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723559237; x=1724164037;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6urcrUwRNn4ooZIoALMb0qS0YSJcXCz3VLqmrwBUYP8=;
        b=LtpE2vDCqtTB4Vob2oaoZUa9grkZBye1/Iyq4RSfSPfH676QpSN6DRlTC3rlQxgDmw
         rYAJBAD8p57d9pPH1tKm8OYpE9OtPvuEmSe/rNY5+MGZ0oGVc1vPqYFkgq8pKW1GlY2U
         9D4SozDcY/8u7JaNTjuzqSQ0krM5myQ9ySRlXYlnjl6QDnDd5UN74EbEmfYRcUwev1H/
         2N17rM54B/oqUpo/nEzm7o+47kHV20X5QYc5bAZPAvUrRrfIs16o3pKqCg8IvJlWhSb7
         wJeULthv+WtLZw3LYfO3eviKH49n4UB07lDugRoNNUuSR88PxIKnQUH+7Z5lYYfo15vk
         F5lA==
X-Gm-Message-State: AOJu0YycNyM4Bv7hvdKnw2LVIjheRhyRAc74++BQP8zwXydTPikf4f7O
	7GS1SwW0rI3hvRARtINTTG8dAgS4dc7t/3nSOVuSQZBDSjN27UNPORHOoL0iI8o=
X-Google-Smtp-Source: AGHT+IF0+XP7FtyBoZummH2iScoMWxKQfOtn1wuDzxoB+IZ0HfXoUR9sn3cF+pe9thuGEe59794sww==
X-Received: by 2002:a05:620a:3916:b0:79d:599a:6a21 with SMTP id af79cd13be357-7a4e151b6f5mr393778385a.16.1723559236561;
        Tue, 13 Aug 2024 07:27:16 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7ded772sm343771485a.91.2024.08.13.07.27.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Aug 2024 07:27:16 -0700 (PDT)
Message-ID: <f428c17e-e0c3-4bff-9ec7-82e7340454ec@baylibre.com>
Date: Tue, 13 Aug 2024 10:27:15 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH 1/3] python3: upgrade 3.12.4 -> 3.12.5
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
References: <20240809122217.3825274-1-tgamblin@baylibre.com>
 <20240813095629734b9d87@mail.local>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <20240813095629734b9d87@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 14:27:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203280


On 2024-08-13 5:56 a.m., Alexandre Belloni wrote:
> Hello Trevor,
>
> This causes a new ptest failure:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6894/steps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6898/steps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/6725/steps/13/logs/stdio
>
> https://autobuilder.yocto.io/pub/non-release/20240812-77/testresults/qemux86-64-ptest/python3.log
>
> FAIL: test_write_read_limited_history (test.test_readline.TestReadline.test_write_read_limited_history)
Looking into it. The test code seems a little strange to me. Might 
submit a patch to disable the test case shortly...
>
> ======================================================================
> ERROR: test_write_read_limited_history (test.test_readline.TestHistoryManipulation.test_write_read_limited_history)
> ----------------------------------------------------------------------
> Traceback (most recent call last):
>    File "/usr/lib/python3.12/test/test_readline.py", line 153, in test_write_read_limited_history
>      readline.read_history_file(TESTFN)
> OSError: [Errno 22] Invalid argument
>
> ======================================================================
> ERROR: test_write_read_limited_history (test.test_readline.TestReadline.test_write_read_limited_history)
> ----------------------------------------------------------------------
> Traceback (most recent call last):
>    File "/usr/lib/python3.12/test/test_readline.py", line 362, in test_write_read_limited_history
>      readline.read_history_file(TESTFN)
> OSError: [Errno 22] Invalid argument
>
> ----------------------------------------------------------------------
> Ran 11 tests in 0.266s
>
> FAILED (errors=2, skipped=3)
> test test_readline failed
>
>
> On 09/08/2024 08:22:15-0400, Trevor Gamblin wrote:
>> Changelog: https://docs.python.org/release/3.12.5/whatsnew/changelog.html
>>
>> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>> ---
>>   .../python/{python3_3.12.4.bb => python3_3.12.5.bb}             | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>   rename meta/recipes-devtools/python/{python3_3.12.4.bb => python3_3.12.5.bb} (99%)
>>
>> diff --git a/meta/recipes-devtools/python/python3_3.12.4.bb b/meta/recipes-devtools/python/python3_3.12.5.bb
>> similarity index 99%
>> rename from meta/recipes-devtools/python/python3_3.12.4.bb
>> rename to meta/recipes-devtools/python/python3_3.12.5.bb
>> index 119fe10ca9..5665c90fa9 100644
>> --- a/meta/recipes-devtools/python/python3_3.12.4.bb
>> +++ b/meta/recipes-devtools/python/python3_3.12.5.bb
>> @@ -39,7 +39,7 @@ SRC_URI:append:class-native = " \
>>              file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
>>              "
>>   
>> -SRC_URI[sha256sum] = "f6d419a6d8743ab26700801b4908d26d97e8b986e14f95de31b32de2b0e79554"
>> +SRC_URI[sha256sum] = "fa8a2e12c5e620b09f53e65bcd87550d2e5a1e2e04bf8ba991dcc55113876397"
>>   
>>   # exclude pre-releases for both python 2.x and 3.x
>>   UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
>> -- 
>> 2.39.2
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#203168): https://lists.openembedded.org/g/openembedded-core/message/203168
>> Mute This Topic: https://lists.openembedded.org/mt/107806767/3617179
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>

